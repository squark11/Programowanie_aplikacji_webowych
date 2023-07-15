import { Component, Input } from '@angular/core';
import { CSS } from '../models/css.model';

@Component({
  selector: 'app-css-generator',
  templateUrl: './css-generator.component.html',
  styleUrls: ['./css-generator.component.scss']
})
export class CssGeneratorComponent {

  title = 'generator-css';

  css: CSS = {
    color: "red",
    border: "2px solid blue",
    boxShadow: "0px 0px 10.5px rgba(0, 0, 0, 0.3)",
    background: "#ddd"
  }

  styleAdd(a:CSS){
    this.css=a;
  }
}
