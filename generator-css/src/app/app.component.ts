import { Component } from '@angular/core';
import {CSS } from 'src/app/models/css.model'
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'generator-css';

  protected css: CSS = {
    color: "red",
    border: "2px solid blue",
    boxShadow: "0px 0px 10.5px rgba(0, 0, 0, 0.3)",
    background: "#ddd"
  }

  

  onColorInputChange(value:string){
    this.css.color = value;
  }
  onBorderInputChange(value:string){
    this.css.border = value;
  }
  onboxShadowInputChange(value:string){
    this.css.boxShadow = value;
  }
  onBackgroundInputChange(value:string){
    this.css.background = value;
  }
}
