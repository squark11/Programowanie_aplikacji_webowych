import { Component } from '@angular/core';
import { delay, map, merge, of, reduce, timer } from 'rxjs';

@Component({
  selector: 'app-voting',
  templateUrl: './voting.component.html',
  styleUrls: ['./voting.component.scss']
})
export class VotingComponent {

  votingResult: string | undefined;

  startVoting() {
    // Tworzenie strumieni reprezentujących głosy poszczególnych osób
    const voters = [
      of(this.getRandomVote()).pipe(delay(2000)), // Pierwsza osoba oddaje głos po 2 sekundach
      of(this.getRandomVote()).pipe(delay(3000)), // Druga osoba oddaje głos po 3 sekundach
      of(this.getRandomVote()).pipe(delay(1000))  // Trzecia osoba oddaje głos po 1 sekundzie
    ];
  
    // Łączenie strumieni i agregowanie wyników głosowania
    merge(...voters)
      .pipe(reduce((acc: string[], curr: string) => [...acc, curr], []))
      .subscribe((result: string[]) => {
        this.votingResult = result.join(', '); // Przypisanie wyniku głosowania do zmiennej votingResult
      });
  }
  
  getRandomVote(): string {
    const votes = ['za', 'przeciw'];
    const randomIndex = Math.floor(Math.random() * votes.length);
    return votes[randomIndex]; // Zwraca losowo 'za' lub 'przeciw'
  }

}
