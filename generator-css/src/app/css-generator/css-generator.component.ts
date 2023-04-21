import { Component, Input } from '@angular/core';
import { CSS } from '../models/css.model';

@Component({
  selector: 'app-css-generator',
  templateUrl: './css-generator.component.html',
  styleUrls: ['./css-generator.component.scss']
})
export class CssGeneratorComponent {
  @Input() css: CSS = {
    color: undefined,
    border: undefined,
    boxShadow: undefined,
    background: undefined
  }
}
