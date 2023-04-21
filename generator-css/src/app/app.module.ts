import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { FormatowanieComponent } from './formatowanie/formatowanie.component';
import { ShowFormattingComponent } from './show-formatting/show-formatting.component';
import { CssGeneratorComponent } from './css-generator/css-generator.component';

@NgModule({
  declarations: [
    AppComponent,
    FormatowanieComponent,
    ShowFormattingComponent,
    CssGeneratorComponent,

  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
