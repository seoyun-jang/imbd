'''
IMDb ������ �ǽ�

RATING
- TCONST : ��ȭ ���� �ĺ���
- AVERAGERATING : ���� �������� �������
- NUMVOTES : ��ǥ ��

CREW
- TCONST : ��ȭ ���� �ĺ���
- DRIECTORS : ���� ���� �ĺ���
- WRITERS : �۰� ���� �ĺ���  

'''

-- ������ �ҷ����� �� ��ó��

SELECT * FROM RATING;

SELECT* FROM CREW;

-- NULL���� ���� ǥ�� ����
UPDATE CREW SET WRITERS=NULL WHERE WRITERS='\N';
COMMIT;
-- AVERAGE RATING�� 6 �̻��� ��ȭ�� TCONST, AVERAGE RATING
SELECT TCONST, AVERAGERATING
FROM RATING R
WHERE AVERAGERATING >= 6;

-- ������ 6�̻��� ��ȭ�� ��ȭ, ���� �ڵ�
SELECT R.TCONST, C.DIRECTORS
FROM RATING R, CREW C
WHERE R.TCONST = C.TCONST AND R.AVERAGERATING >= 6;

-- ������ 6�̻��� ��ȭ�� ��ȭ, ���� �ڵ� -> ���� �ڵ� ������ ����
SELECT R.TCONST, C.DIRECTORS, R.AVERAGERATING
FROM RATING R, CREW C
WHERE R.TCONST = C.TCONST AND R.AVERAGERATING >= 6 AND C.DIRECTORS != '\N'
ORDER BY C.DIRECTORS;

-- ��ȭ�� ����, �۰� �ڵ� (��, �۰� �ڵ尡 NULL�� �ƴ� ��츸)
SELECT R.TCONST AS ��ȭ�ڵ�, C.DIRECTORS AS �����ڵ�, C.WRITERS AS �۰��ڵ�
FROM RATING R JOIN CREW C
ON R.TCONST = C.TCONST
WHERE C.WRITERS IS NOT NULL
ORDER BY R.TCONST;

SELECT TCONST AS ��ȭ�ڵ�, C.DIRECTORS AS �����ڵ�, C.WRITERS AS �۰��ڵ�
FROM RATING R JOIN CREW C
USING (TCONST)
WHERE C.WRITERS IS NOT NULL
ORDER BY TCONST;
-- USING���� ����� ��� ����� �÷����� ��Ī�� ������ �ʴ´�.


