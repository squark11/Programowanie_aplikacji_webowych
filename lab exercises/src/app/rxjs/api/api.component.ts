import { Component } from '@angular/core';
import { delay, map, mapTo, merge, mergeMap, of, timer } from 'rxjs';

@Component({
  selector: 'app-api',
  templateUrl: './api.component.html',
  styleUrls: ['./api.component.scss']
})
export class ApiComponent {

  apiResult: string | undefined;

  runRequests() {
    // Trzy zapytania do API jedno po drugim
    const sequentialRequests = merge(
      of('Request 1').pipe(
        delay(1000),
        map((result) => result + ' (from stream 1)')
      ),
      of('Request 2').pipe(
        delay(2000),
        map((result) => result + ' (from stream 2)')
      ),
      of('Request 3').pipe(
        delay(3000),
        map((result) => result + ' (from stream 3)')
      )
    );

    // Trzy zapytania do API równolegle
    const parallelRequests = merge(
      timer(1000).pipe(
        mapTo('Request 1'),
        delay(1000),
        map((result) => result + ' (from stream 1)')
      ),
      timer(2000).pipe(
        mapTo('Request 2'),
        delay(2000),
        map((result) => result + ' (from stream 2)')
      ),
      timer(3000).pipe(
        mapTo('Request 3'),
        delay(3000),
        map((result) => result + ' (from stream 3)')
      )
    );

    // Dwa zapytania równolegle i trzecie po zakończeniu dwóch poprzednich
    const parallelWithSequentialRequest = merge(
      of('Request 1').pipe(
        delay(1000),
        map((result) => result + ' (from stream 1)')
      ),
      of('Request 2').pipe(
        delay(2000),
        map((result) => result + ' (from stream 2)')
      )
    ).pipe(
      mergeMap((result) =>
        of('Request 3').pipe(
          delay(1000),
          map((thirdResult) => [result, thirdResult])
        )
      ),
      map(([result1, result2]) => [result1, result2, 'Request 3']),
      map((results) => results.map((result, index) => result + ' (from stream ' + (index + 1) + ')'))
    );


    // sequentialRequests.subscribe((result: string) => {
    //   this.apiResult = result;
    // });

    // parallelRequests.subscribe((result: string) => {
    //   this.apiResult = result;
    // });

    parallelWithSequentialRequest.subscribe((results: string[]) => {
      this.apiResult = results.join(', ');
    });
  }
}
