import { Component, ElementRef } from '@angular/core';
import { debounceTime, distinctUntilChanged, filter, fromEvent, map, scan } from 'rxjs';

@Component({
  selector: 'app-search-box',
  templateUrl: './search-box.component.html',
  styleUrls: ['./search-box.component.scss']
})
export class SearchBoxComponent { 
  value: any;
  searchHistory: string[] = [];

  handleInput(target: EventTarget) {
    const inputElement = target as HTMLInputElement;

    if (inputElement.value !== '') {
      fromEvent(inputElement, 'input')
        .pipe(
          debounceTime(300),
          distinctUntilChanged(),
          map(() => inputElement.value),
          filter(searchValue => searchValue !== ''),
          scan((history: string[], searchValue: string) => [...history, searchValue], [])
        )
        .subscribe(history => {
          this.searchHistory = history;
          this.value = history[history.length - 1];
        });
    }
  }
}
