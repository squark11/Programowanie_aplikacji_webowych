import { Component } from '@angular/core';
import { debounceTime, filter, fromEvent, sampleTime } from 'rxjs';

@Component({
  selector: 'app-app-mouse-coordinates-interval',
  templateUrl: './app-mouse-coordinates-interval.component.html',
  styleUrls: ['./app-mouse-coordinates-interval.component.scss']
})
export class AppMouseCoordinatesIntervalComponent {
  
  coordinates: string = '';

  ngOnInit() {
    const mousemove$ = fromEvent<MouseEvent>(document, 'mousemove');

    mousemove$.pipe(
      sampleTime(1000),
      debounceTime(2000),
      filter(event => event.clientX > 500)
    ).subscribe(event => {
      this.coordinates = `(${event.clientX}, ${event.clientY})`;
    });
  }

}
