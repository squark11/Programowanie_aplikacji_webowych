import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormatowanieComponent } from './formatowanie.component';

describe('FormatowanieComponent', () => {
  let component: FormatowanieComponent;
  let fixture: ComponentFixture<FormatowanieComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormatowanieComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FormatowanieComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
