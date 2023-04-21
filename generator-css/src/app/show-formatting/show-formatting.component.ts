import { Component, Input } from '@angular/core';
import {CSS } from 'src/app/models/css.model'

@Component({
  selector: 'app-show-formatting',
  templateUrl: './show-formatting.component.html',
  styleUrls: ['./show-formatting.component.scss']
})
export class ShowFormattingComponent {
  
  @Input() css: CSS = {
    color: undefined,
    border: undefined,
    boxShadow: undefined,
    background: undefined
  }
}
