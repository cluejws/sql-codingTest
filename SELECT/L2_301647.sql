SELECT A.ID AS 'ID', A.GENOTYPE AS 'GENOTYPE', B.GENOTYPE AS 'PARENT_GENOTYPE'
FROM ECOLI_DATA A JOIN ECOLI_DATA B ON (A.PARENT_ID = B.ID)
WHERE (A.GENOTYPE & B.GENOTYPE = B.GENOTYPE)
ORDER BY ID ASC;