from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
import time

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins = ["http://localhost:8088/web", "http://localhost:8088"],
    allow_methods = ["*"],
    allow_headers = ["*"],
    allow_credentials = True
)


@app.get("/")
def test( test : str): 
    test += "fast결과값"
    return {"test" : test}



@app.post("/files")
def getfile(file : UploadFile=File(...)):

    return {"file_name" : file.filename}


@app.get("/imgfiles")
def getfile(test : str):

    # Headless 옵션 설정
    options = Options()
    options.add_argument("--headless")  # 창 없이 실행
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--disable-gpu")

    # 크롬 드라이버 실행
    s = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=s, options=options)

    # 네이버 접속
    driver.get("https://www.naver.com/")

    # 검색창에 "오리" 입력 후 검색
    map_element = driver.find_element(By.CSS_SELECTOR, "div.search_input_box > input#query")
    map_element.click()
    map_element.send_keys(test)
    map_element.send_keys(Keys.RETURN)

    # 결과 로딩 대기
    time.sleep(1)  # 혹은 WebDriverWait 사용

    # 탭 클릭 (예: VIEW)
    map_element = driver.find_elements(By.CSS_SELECTOR, "a.tab")
    map_element[0].click()

    # 결과 로딩 대기
    time.sleep(1)

    # 썸네일 이미지 추출
    map_element = driver.find_elements(By.CSS_SELECTOR, "div.mod_vw_thumb.link_thumb.loaded")
    a = map_element[0].find_element(By.CSS_SELECTOR, "img")
    img_src = a.get_attribute("src")

    # 결과 출력
    print(img_src)

    # 드라이버 종료
    driver.quit()

    return {"img_src" : img_src}
