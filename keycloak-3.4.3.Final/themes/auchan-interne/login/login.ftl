<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "form">
        <#if realm.password>
            <form id="kc-form-login" class="login-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="login-box mdc-card">
                    <div class="login-box__content">
                        <div class="login-input mdc-form-field">
                            <div class="mdc-text-field" data-mdc-auto-init="MDCTextField">
                                <#if usernameEditDisabled??>
                                    <input tabindex="1" id="username" class="mdc-text-field__input" name="username" value="${(login.username!'')}" type="text" disabled />
                                <#else>
                                    <input tabindex="1" id="username" class="mdc-text-field__input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                                </#if>
                                <label class="mdc-floating-label" for="username">
                                    <#if !realm.loginWithEmailAllowed>${msg("username")}
                                    <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                    <#else>${msg("email")}</#if>
                                </label>
                                <div class="mdc-line-ripple"></div>
                            </div>
                        </div>

                        <div class="login-input mdc-form-field">
                            <div class="mdc-text-field" data-mdc-auto-init="MDCTextField">
                                <input tabindex="2" id="password" class="mdc-text-field__input" name="password" type="password" autocomplete="off" />
                                <label class="mdc-floating-label" for="password">${msg("password")}</label>
                                <div class="mdc-line-ripple"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                    </div>

                    <button tabindex="4" class="login-btn-submit mdc-fab material-icons" name="login" id="kc-login" type="submit">
                        <span class="mdc-fab__icon">
                            keyboard_arrow_right
                        </span>
                    </button>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
