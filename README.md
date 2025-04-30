# ILI 주간 예측 프로젝트 (June_LAB1)

## 프로젝트 개요

이 프로젝트는 과거 인플루엔자 유사 질환(Influenza-like Illness, ILI) 데이터를 기반으로 주간 `ILITOTAL` (총 환자 수)을 예측하는 것을 목표로 합니다. R의 `fpp3` 생태계를 활용하여 ARIMA, ETS, TSLM, Prophet 등 다양한 시계열 예측 모델을 구현하고 비교합니다.

주요 작업 흐름은 다음과 같습니다:
1.  **Lite Version 예측:** 기본 설정 모델을 사용하여 매주 재학습하며 다음 1주를 예측하고 시각화하여 베이스라인 성능을 확인합니다.
2.  **Heavy Version Model 학습 및 저장:** 전체 데이터를 사용하여 강화된 설정(예: ARIMA 탐색 강화, Box-Cox 변환 등)으로 모델을 학습시키고, 학습된 모델 객체와 필요한 파라미터(예: Box-Cox lambda)를 파일로 저장합니다.
3.  **최종 예측:** 저장된 강력한 모델을 로드하여 미래 8주 예측 결과를 생성하고 테이블 및 CSV 파일로 저장합니다.

## 프로젝트 구조
June_LAB1/
├── .gitignore
├── June_LAB1.Rproj # R 프로젝트 파일
├── README.md # 프로젝트 설명 파일
│
├── 01_docs/ # 프로젝트 관련 문서
├── 02_data/ # 데이터 파일
│ ├── raw/ # 원본 데이터 (ILINet.csv)
│ └── processed/ # 전처리된 데이터
├── 03_scripts/ # R 스크립트
│ ├── utils/ # 재사용 함수 (get_fpp3.R, get_lib.R 등)
│ └── main_analysis.Rmd # 메인 분석 스크립트
├── 04_models/ # 저장된 모델 객체 (final_heavy_ili_models_bc.rds 등)
├── 05_output/ # 결과물
│ ├── plots/ # 생성된 그래프
│ ├── tables/ # 생성된 테이블 (final_8week_forecast_YYYYMMDD.csv 등)
│ └── reports/ # R Markdown 결과물 (HTML 등)
└── 99_temp_archive/ # 임시 파일, 아카이브


## 데이터

*   **원본 데이터:** `02_data/raw/ILINet.csv` (사용자가 제공해야 함)
*   **예측 대상 변수:** `ILITOTAL`

## 사용된 모델

*   ARIMA (AutoRegressive Integrated Moving Average)
*   ETS (Exponential Smoothing / Error, Trend, Seasonality)
*   TSLM (Time Series Linear Model with Trend and Fourier terms)
*   Prophet

## 주요 결과물

*   라이트 롤링 예측 결과 시각화 (`05_output/plots/`)
*   최종 8주 예측 결과 테이블 (`05_output/tables/` 폴더 내 CSV 파일)

## 실행 방법

1.  R 및 RStudio를 설치합니다.
2.  이 저장소를 클론합니다.
3.  `June_LAB1.Rproj` 파일을 RStudio에서 엽니다.
4.  필요한 R 패키지를 설치합니다 (아래 Dependencies 참조 또는 스크립트 내 확인).
    ```R
    # 예시: install.packages(c("fpp3", "tidyverse", "lubridate", "here", "data.table", "fable.prophet", "scales", "ggnewscale"))
    ```
5.  `02_data/raw/` 폴더에 `ILINet.csv` 파일을 위치시킵니다.
6.  메인 분석 스크립트(예: `03_scripts/main_analysis.Rmd` 또는 `.R`)를 실행합니다.
    *   **최초 실행 시:** 단계 3의 "빡센" 모델 학습이 실행되어 시간이 오래 걸릴 수 있습니다. 모델 파일(`*.rds`)이 생성됩니다.
    *   **이후 실행 시:** 저장된 모델 파일을 사용하여 단계 3 학습을 건너<0xEB><0x9C><0x84>니다 (스크립트 내 `force_retrain_heavy_model` 변수가 `FALSE`일 경우).
7.  `05_output/` 폴더에서 생성된 플롯과 테이블을 확인합니다.

## 주요 의존성 (R Packages)

*   `fpp3` (및 핵심 구성 요소: `tsibble`, `fable`, `feasts`)
*   `tidyverse`
*   `lubridate`
*   `here`
*   `data.table`
*   `fable.prophet`
*   `scales`
*   `ggnewscale`

---
