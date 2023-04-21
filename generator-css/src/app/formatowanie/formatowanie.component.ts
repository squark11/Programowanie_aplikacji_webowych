import { Component, EventEmitter, Output } from '@angular/core';
import {CSS } from 'src/app/models/css.model'

@Component({
  selector: 'app-formatowanie',
  templateUrl: './formatowanie.component.html',
  styleUrls: ['./formatowanie.component.scss']
})
export class FormatowanieComponent {
  protected css: CSS = {
    color: "red",
    border: "2px solid blue",
    boxShadow: "0px 0px 10.5px rgba(0, 0, 0, 0.3)",
    background: "#ddd"
  }
  @Output() newCss = new EventEmitter<CSS>();

  onColorInputChange(value:string){
    this.css.color = value;
    this.newCss.emit(this.css);
  }
  onBorderInputChange(value:string){
    this.css.border = value;
    this.newCss.emit(this.css);
  }
  onboxShadowInputChange(value:string){
    this.css.boxShadow = value;
    this.newCss.emit(this.css);
  }
  onBackgroundInputChange(value:string){
    this.css.background = value;
    this.newCss.emit(this.css);
  }


}
