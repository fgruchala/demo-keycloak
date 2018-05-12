import {enableProdMode} from '@angular/core';
import {platformBrowserDynamic} from '@angular/platform-browser-dynamic';
import * as Keycloak from 'keycloak-js';

import {AppModule} from './app/app.module';
import {environment} from './environments/environment';

if (environment.production) {
  enableProdMode();
}

const keycloak = Keycloak(environment.auth);

keycloak
  .init({onLoad: 'login-required'})
  .success(authenticated => {
    if (authenticated) {
      platformBrowserDynamic().bootstrapModule(AppModule)
        .catch(err => console.log(err));

      // Load User Infos
      keycloak
        .loadUserInfo()
        .success(userInfos => console.log('User Infos', userInfos));

      // Load User Profile
      keycloak
        .loadUserProfile()
        .success(userProfile => console.log('User Profile', userProfile));
    }
  });
