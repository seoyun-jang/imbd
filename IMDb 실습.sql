'''
IMDb 데이터 실습

RATING
- TCONST : 영화 고유 식별자
- AVERAGERATING : 유저 평점들의 가중평균
- NUMVOTES : 투표 수

CREW
- TCONST : 영화 고유 식별자
- DRIECTORS : 감독 고유 식별자
- WRITERS : 작가 고유 식별자  

'''

-- 데이터 불러오기 및 전처리

SELECT * FROM RATING;

SELECT* FROM CREW;

-- NULL값에 대한 표기 변경
UPDATE CREW SET WRITERS=NULL WHERE WRITERS='\N';
COMMIT;
-- AVERAGE RATING이 6 이상인 영화의 TCONST, AVERAGE RATING
SELECT TCONST, AVERAGERATING
FROM RATING R
WHERE AVERAGERATING >= 6;

-- 평점이 6이상인 영화의 영화, 감독 코드
SELECT R.TCONST, C.DIRECTORS
FROM RATING R, CREW C
WHERE R.TCONST = C.TCONST AND R.AVERAGERATING >= 6;

-- 평점이 6이상인 영화의 영화, 감독 코드 -> 감독 코드 순으로 정렬
SELECT R.TCONST, C.DIRECTORS, R.AVERAGERATING
FROM RATING R, CREW C
WHERE R.TCONST = C.TCONST AND R.AVERAGERATING >= 6 AND C.DIRECTORS != '\N'
ORDER BY C.DIRECTORS;

-- 영화의 감독, 작가 코드 (단, 작가 코드가 NULL이 아닌 경우만)
SELECT R.TCONST AS 영화코드, C.DIRECTORS AS 감독코드, C.WRITERS AS 작가코드
FROM RATING R JOIN CREW C
ON R.TCONST = C.TCONST
WHERE C.WRITERS IS NOT NULL
ORDER BY R.TCONST;

SELECT TCONST AS 영화코드, C.DIRECTORS AS 감독코드, C.WRITERS AS 작가코드
FROM RATING R JOIN CREW C
USING (TCONST)
WHERE C.WRITERS IS NOT NULL
ORDER BY TCONST;
-- USING절을 사용할 경우 공통된 컬럼에는 별칭을 붙이지 않는다.


