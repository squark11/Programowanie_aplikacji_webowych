import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { CssInputComponent } from './css-input/css-input.component';
import { NowyComponent } from './nowy/nowy.component';
// import { ModelsComponent } from './models/models.component';

@NgModule({
  // declarations: [
  //   AppComponent,
  //   CssInputComponent,
  //   ModelsComponent
  // ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent],
  declarations: [
    CssInputComponent,
    NowyComponent
  ]
})
export class AppModule {
  
 }
