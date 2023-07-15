import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CssGeneratorComponent } from './css-generator.component';

describe('CssGeneratorComponent', () => {
  let component: CssGeneratorComponent;
  let fixture: ComponentFixture<CssGeneratorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CssGeneratorComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CssGeneratorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
