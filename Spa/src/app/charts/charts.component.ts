import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Category } from '../domain/category';
import { Chart } from 'chart.js';

@Component({
  selector: 'app-charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.scss']
})
export class ChartsComponent implements OnInit {
  chart: any;
  diagnosis: { score: number, typequestion: string }[] = [];

  constructor(private route: ActivatedRoute) {}

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      if (params.has('diagnosis')) {
        const diagnosisData = params.get('diagnosis');
        if (diagnosisData) {
          this.diagnosis = JSON.parse(diagnosisData);
          this.generateChart();
        }
      }
    });
  }

  generateChart() {
    const labels = this.diagnosis.map(item => item.typequestion);
    const scores = this.diagnosis.map(item => item.score);

    this.chart = new Chart('canvas', {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [
          {
            label: 'Score',
            data: scores,
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
          }
        ]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true,
            max: 15
          }
        }
      }
    });
  }
}
