import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { CssInputComponent } from './css-input/css-input.component';
import { FormatowanieComponent } from './formatowanie/formatowanie.component';
import { PodgladComponent } from './podglad/podglad.component';
import { KodCSSComponent } from './kod-css/kod-css.component';

@NgModule({
  declarations: [
    AppComponent,
    CssInputComponent,
    FormatowanieComponent,
    PodgladComponent,
    KodCSSComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
