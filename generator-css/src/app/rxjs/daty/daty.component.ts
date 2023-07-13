import { Component } from '@angular/core';
import { Observable, take } from 'rxjs';

@Component({
  selector: 'app-daty',
  templateUrl: './daty.component.html',
  styleUrls: ['./daty.component.scss']
})
export class DatyComponent {

  dates: Date[] = [];

  ngOnInit() {
    const startDate = new Date();

    const dates: Observable<Date> = new Observable(observer => {
      let count = 0;
      const intervalId = setInterval(() => {
        const currentDate = new Date(startDate.getTime() + count * 24 * 60 * 60 * 1000);
        observer.next(currentDate);
        count++;
      }, 1000);

      return () => {
        clearInterval(intervalId);
      };
    });

    dates.pipe(
      take(10)
    ).subscribe(date => this.dates.push(date));
  }
}
