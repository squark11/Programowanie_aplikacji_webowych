import { Component } from '@angular/core';
import { of } from 'rxjs';
import { filter, take, find, map } from 'rxjs';

@Component({
  selector: 'app-rozgrzewka',
  templateUrl: './rozgrzewka.component.html',
  styleUrls: ['./rozgrzewka.component.scss']
})
export class RozgrzewkaComponent {
  
  evenNumbers: number[] = [];
  first5Numbers: number[] = [];
  number8: number | undefined;
  numberNames: string[] = [];

  constructor() {
    const numbers = of(...Array(20).keys());

    numbers.pipe(
      filter(num => num % 2 === 0)
    ).subscribe(result => this.evenNumbers.push(result));

    numbers.pipe(
      take(5)
    ).subscribe(result => this.first5Numbers.push(result));

    numbers.pipe(
      find(num => num === 8)
    ).subscribe(result => this.number8 = result);

    numbers.pipe(
      map(num => `Liczba ${num + 1}`)
    ).subscribe(result => this.numberNames.push(result));
  }
}
