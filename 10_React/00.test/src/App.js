"use client";

import React, { useEffect } from 'react';
import ReactECharts from 'echarts-for-react';
import * as echarts from 'echarts';

// 파이 차트 컴포넌트
const PieChart = () => {
  useEffect(() => {
    var chartDom = document.getElementById('pie-chart');
    var myChart = echarts.init(chartDom);

    var option = {
      tooltip: { trigger: 'item' },
      legend: { top: '5%', left: 'center' },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          label: { show: false, position: 'center' },
          emphasis: {
            label: { show: true, fontSize: 40, fontWeight: 'bold' }
          },
          labelLine: { show: false },
          data: [
            { value: 1048, name: 'Search Engine' },
            { value: 735, name: 'Direct' },
            { value: 580, name: 'Email' },
            { value: 484, name: 'Union Ads' },
            { value: 300, name: 'Video Ads' }
          ]
        }
      ]
    };

    myChart.setOption(option);
    window.addEventListener('resize', myChart.resize);

    return () => {
      window.removeEventListener('resize', myChart.resize);
      myChart.dispose();
    };
  }, []);

  return <div id="pie-chart" style={{ width: '100%', height: '400px' }}></div>;
};

// 라인 차트 컴포넌트
const LineChart = () => {
  const option = {
    title: { text: '기본 echart' },
    tooltip: {},
    xAxis: { type: 'category', data: ['월', '화', '수', '목', '금', '토', '일'] },
    yAxis: { type: 'value' },
    series: [{ data: [150, 200, 300, 400, 100, 200, 500], type: 'line' }]
  };

  return <ReactECharts option={option} style={{ height: '400px' }} />;
};

const BarChart = () => {
  const option = {
    title: { text: '기본 echart' },
    tooltip: {},
    xAxis: { type: 'category', data: ['월', '화', '수', '목', '금', '토', '일'] },
    yAxis: { type: 'value' },
    series: [{ data: [150, 200, 300, 400, 100, 200, 500], type: 'bar' }]
  };

  return <ReactECharts option={option} style={{ height: '400px' }} />;
};

// 메인 컴포넌트
export default function App() {
  return (
    <>
      <h2>📉 Line Chart</h2>
      <LineChart />
      <h2>📊 Bar Chart</h2>
      <BarChart />
      <h2>🥧 Pie Chart</h2>
      <PieChart />
    </>
  );
}
