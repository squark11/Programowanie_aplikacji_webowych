import { Component } from '@angular/core';
import { CSS } from './models/css.model';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
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
