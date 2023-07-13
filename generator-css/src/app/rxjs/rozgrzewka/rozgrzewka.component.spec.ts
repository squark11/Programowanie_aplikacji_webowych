import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RozgrzewkaComponent } from './rozgrzewka.component';

describe('RozgrzewkaComponent', () => {
  let component: RozgrzewkaComponent;
  let fixture: ComponentFixture<RozgrzewkaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RozgrzewkaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RozgrzewkaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
