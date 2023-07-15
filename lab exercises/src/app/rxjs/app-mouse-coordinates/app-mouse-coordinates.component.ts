import { Component, HostListener } from '@angular/core';
import { fromEvent } from 'rxjs';

@Component({
  selector: 'app-app-mouse-coordinates',
  templateUrl: './app-mouse-coordinates.component.html',
  styleUrls: ['./app-mouse-coordinates.component.scss']
})
export class AppMouseCoordinatesComponent {
  coordinates: MouseEvent;

  ngOnInit() {
    const click$ = fromEvent(document, 'click');

    click$.subscribe((event: MouseEvent) => {
      this.coordinates = event;
    });
  }
}