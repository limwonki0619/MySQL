-- 04. JOIN, SUBQUERY �������� 

-- �������� 1. �л�(STUDENT)���̺�� ����(ENROL)���̺��� NATURAL JOIN�϶�.
SELECT * FROM STUDENT NATURAL JOIN ENROL;

-- �������� 2. �й�(STU_NO), �̸�(STU_NAME), �����̸�(SUB_NAME), ����(ENR_GRADE)�� �˻��϶�(EQUI JOIN)
SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;
SELECT * FROM ENROL;

SELECT STUDENT.STU_NO, STU_NAME, SUB_NAME, ENR_GRADE 
FROM STUDENT, ENROL, SUBJECT
WHERE STUDENT.STU_NO = ENROL.STU_NO
    AND ENROL.SUB_NO = SUBJECT.SUB_NO;
    
-- �������� 3. �����̸��� �й�, ������ �˻��϶�(NATURAL JOIN)
SELECT SUB_NAME, STU_NO, ENR_GRADE
FROM SUBJECT NATURAL JOIN ENROL;

-- �������� 4. �����̸��� �й�, ������ �˻��϶�(JOIN USING)
SELECT SUB_NAME, STU_NO, ENR_GRADE
FROM SUBJECT JOIN ENROL USING(SUB_NO);

-- �������� 5. ������ 70�� �̻��� �л� �̸��� �˻��϶�(EQUI JOIN)
SELECT STU_NAME, ENR_GRADE 
FROM STUDENT, ENROL
WHERE STUDENT.STU_NO = ENROL.STU_NO
    AND ENR_GRADE >= 70;

-- �������� 6. ������ 60�� �̻��� �л� �̸��� �˻��϶�(JOIN USING)
SELECT STU_NAME, ENR_GRADE 
FROM STUDENT JOIN ENROL USING(STU_NO)
    WHERE ENR_GRADE >= 60;
    
-- �������� 7. ������ 70�� ������ �л� �̸��� �˻��϶�(NATURAL JOIN)
SELECT STU_NAME, ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL
    WHERE ENR_GRADE <= 70;
    
-- �������� 8. ������ �л��� �����ϴ� �����̸��� ���� ������ �˻��϶�. (EQUI JOIN)
SELECT STU_NAME, SUB_NAME, SUB_PROF
FROM STUDENT, ENROL, SUBJECT
WHERE STUDENT.STU_NO = ENROL.STU_NO
    AND ENROL.SUB_NO = SUBJECT.SUB_NO
    AND STU_NAME = '������';
    
-- �������� 9. ������ �л��� �����ϴ� �����̸��� ���� ������ �˻��϶�. (NATURAL JOIN)
SELECT STUDENT.STU_NAME, SUB_NAME, SUB_PROF
FROM STUDENT NATURAL JOIN ENROL NATURAL JOIN SUBJECT
WHERE STU_NAME ='������';

-- �������� 10. ������ �л��� �����ϴ� �����̸��� ���� ������ �˻��϶�. (JOIN USING)
SELECT STUDENT.STU_NAME, SUB_NAME, SUB_PROF
FROM STUDENT JOIN ENROL USING(STU_NO) JOIN SUBJECT USING(SUB_NO)
WHERE STU_NAME ='������';

-- �������� 11. ������ ������ �����ϴ� ������ �����ϴ� �л��� �̸��� �˻��϶�.
SELECT SUB_PROF, STU_NAME
FROM SUBJECT NATURAL JOIN ENROL NATURAL JOIN STUDENT
WHERE SUB_PROF = '������';

-- �������� 12. ��ǻ�Ͱ����� �����ϴ� �л����� �й��� �̸��� �˻��϶�. 
SELECT STU_NO, STU_NAME, SUB_NAME
FROM SUBJECT NATURAL JOIN ENROL NATURAL JOIN STUDENT
WHERE SUB_NAME = '��ǻ�Ͱ���';

-- �������� 13. �ý��ۺм�����, ����Ʈ��������� �����ϴ� �л����� �й�, �̸��� �й������� �˻��϶�
SELECT STU_NO, STU_NAME, SUB_NAME
FROM SUBJECT NATURAL JOIN ENROL NATURAL JOIN STUDENT
WHERE SUB_NAME = '�ý��ۺм�����' OR SUB_NAME = '����Ʈ�������'
ORDER BY 1;

-- �������� 14. ������ 1�г� �����̰ų�, ��ǻ���������� ������ ������ ���, �� ������� �����ϴ� �л����� �й��� �̸��� �˻��϶�.
SELECT STU_NO, STU_NAME, SUB_NAME, SUB_GRADE, SUB_DEPT
FROM SUBJECT NATURAL JOIN ENROL NATURAL JOIN STUDENT
WHERE SUB_GRADE = 1 OR SUB_DEPT = '��ǻ������';

-- �������� 15. �����۹�, �������ڽ����� �����ϴ� �л����� �й�, �̸��� �й������� �˻��϶�. (NATRUAL JOIN)
SELECT STU_NO, STU_NAME, SUB_NAME
FROM ENROL NATURAL JOIN SUBJECT NATURAL JOIN STUDENT
WHERE SUB_NAME IN ('�����۹�', '�������ڽ���')
ORDER BY 1;

-- �������� 16. ���¿�����, ������ ������ �����ϴ� ������ �����ϴ� �л��� �й��� �˻��϶�. (JOIN USING)
SELECT STU_NO, STU_NAME, SUB_PROF, SUB_NAME
FROM ENROL JOIN SUBJECT USING(SUB_NO) JOIN STUDENT USING(STU_NO)
WHERE SUB_PROF IN ('���¿�', '������');

-- �������� 17. �л��� �̸��� ������ �˻��϶�. 
SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;
SELECT * FROM ENROL;

SELECT STU_NAME, ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL;

-- �������� 18. �̸��� '���Ѻ�'�� �л��� �����ϴ� �����̸��� �˻��϶�.
SELECT STU_NAME, SUB_NAME
FROM STUDENT NATURAL JOIN ENROL NATURAL JOIN SUBJECT
WHERE STU_NAME = '���Ѻ�';

-- �������� 19. ���л��� �������� ������ �����̸��� ��� �˻��϶�. 
SELECT STU_NAME, SUB_NAME, STU_GENDER
FROM STUDENT NATURAL JOIN ENROL NATURAL JOIN SUBJECT
WHERE STU_GENDER = 'F';


-- �������� 20. ü���� 60 �̻��� �л��� �����ϴ� ������ �����̸��� ��� �˻��϶�.
SELECT STU_NAME, SUB_NAME, STU_WEIGHT
FROM STUDENT NATURAL JOIN ENROL NATURAL JOIN SUBJECT
WHERE STU_WEIGHT >= 60;

-- �������� 21. ��ǻ���������� ������ ������ �����ϴ� ��� �л��� �й��� �̸��� �˻��϶�.
SELECT STU_NO, STU_NAME, SUB_DEPT
FROM STUDENT NATURAL JOIN ENROL NATURAL JOIN SUBJECT
WHERE SUB_DEPT = '��ǻ������';

-- �������� 22. ������ 70�� �̻��� �л� ���� �˻��϶�. 
SELECT COUNT(*)
FROM STUDENT NATURAL JOIN ENROL
WHERE ENR_GRADE >= 70;

-- �������� 23. ���л��̸鼭, ������ ������ ������ �����ϴ� �л��� �̸��� �˻��϶�.
SELECT STU_NAME, STU_GENDER, SUB_PROF
FROM STUDENT NATURAL JOIN ENROL NATURAL JOIN SUBJECT
WHERE STU_GENDER = 'F' AND SUB_PROF = '������';

-- �������� 24. ������ �л��� ����������� ���� ������ ���� �л��� �й��� �̸��� �˻��϶�.
SELECT STU_NO, STU_NAME, ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL
WHERE ENR_GRADE > (SELECT AVG(ENR_GRADE) 
    FROM STUDENT NATURAL JOIN ENROL 
    WHERE STU_NAME = '������');
    
    
-- �������� 25. ������ �л��� ��� �������� ���� ������ ���� �л��� �й��� �̸��� �˻��϶�.
SELECT STU_NO, STU_NAME, ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL
WHERE ENR_GRADE < (SELECT AVG(ENR_GRADE) 
    FROM STUDENT NATURAL JOIN ENROL 
    WHERE STU_NAME = '������');


-- �������� 26. ��ü �л��� ��� �������� ������ ���� �л��� �й�, �̸�, �����̸�, ������ �˻��϶�.
SELECT STU_NO, STU_NAME, SUB_NAME, ENR_GRADE
FROM STUDENT NATURAL JOIN ENROL NATURAL JOIN SUBJECT
WHERE ENR_GRADE > (SELECT AVG(ENR_GRADE) 
    FROM STUDENT NATURAL JOIN ENROL);

-- �������� 27. ������ �� �а� �л����� ��� �������� ���� �л��� �й��� �˻��϶�.
SELECT STU_NO
FROM ENROL
WHERE ENR_GRADE > ALL (SELECT AVG(ENR_GRADE)
                        FROM STUDENT A, ENROL B
                        WHERE A.STU_NO = B.STU_NO
                        GROUP BY A.STU_DEPT);
                        
-- �������� 28. ������ �ְ� ���� �л����� �ְ� ������ ���� �а��� �а���� ������ �˻��϶�.
SELECT A.STU_DEPT, MAX(B.ENR_GRADE)
FROM STUDENT A, ENROL B 
WHERE A.STU_NO = B.STU_NO
GROUP BY A.STU_DEPT
HAVING MAX(B.ENR_GRADE) > (SELECT MAX(ENR_GRADE) 
                             FROM STUDENT JOIN ENROL USING(STU_NO)
                             WHERE STU_DEPT = '���');

-- �������� 29. ��ǻ�������� �л����� ��� ������ ���� �л����� �й��� �̸� ��� ������ ���� ������ �˻��϶�.
SELECT STU_NO, STU_NAME, AVG(ENR_GRADE) 
FROM STUDENT NATURAL JOIN ENROL
WHERE STU_DEPT = '��ǻ������'
GROUP BY STU_NO, STU_NAME
ORDER BY 3 DESC;

-- �������� 30. �ý��ۺм����� ������ ������ �л����� �й�, �̸�, ������ ���� ������ �˻��϶�.
SELECT STU_NO, STU_NAME, ENR_GRADE, SUB_NAME
FROM ENROL NATURAL JOIN SUBJECT NATURAL JOIN STUDENT
WHERE SUB_NAME = '�ý��ۺм�����'
ORDER BY 3 DESC;

-- �������� 31. 2���� �̻� ������ �л����� �й�, �̸�, �������� ���� ���������� ���� ������ �˻��϶�.
SELECT STU_NO, STU_NAME, COUNT(STU_NO)
FROM ENROL NATURAL JOIN STUDENT NATURAL JOIN SUBJECT
GROUP BY STU_NO, STU_NAME
HAVING COUNT(STU_NO) >= 2;

-- �������� 32. 1������ ������ �л����� �й�, �̸��� �а��� �й� ������ �˻��϶�.
SELECT STU_NO, STU_NAME, STU_DEPT, COUNT(STU_NO)
FROM ENROL NATURAL JOIN STUDENT NATURAL JOIN SUBJECT
GROUP BY STU_NO, STU_NAME, STU_DEPT
HAVING COUNT(STU_NO) = 1
ORDER BY STU_DEPT, STU_NO DESC;


-- �������� 33. ��ǻ�������� �л��� �� ��� ������ �ְ��� �л��� �й�, �̸�, ��� ������ �˻��϶�
SELECT *
FROM ( 
    SELECT STU_NO, STU_NAME, STU_DEPT, AVG(ENR_GRADE) 
    FROM STUDENT NATURAL JOIN ENROL
    GROUP BY STU_NO, STU_NAME, STU_DEPT
    ORDER BY 4 DESC 
    )
WHERE ROWNUM = 1;


-- �������� 34. ��ǻ�Ͱ��а� �ý��ۺм����� ������ �����ϴ� �л��� �й�, �̸��� �й� ������ �˻��϶�. 
SELECT STU_NO, STU_NAME, SUB_NAME 
FROM STUDENT NATURAL JOIN ENROL NATURAL JOIN SUBJECT
WHERE SUB_NAME IN ('��ǻ�Ͱ���', '�ý��ۺм�����')
ORDER BY 1;
