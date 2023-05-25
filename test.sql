
WITH SUM_MME AS (SELECT BUYER_ZIP, BUYER_COUNTY, CAST(SUM(MME) AS INT) AS MME_SUM FROM CSE532.DEA_NY, CSE532.ZIPPOP WHERE CSE532.DEA_NY.BUYER_ZIP = CSE532.ZIPPOP.ZIP GROUP BY BUYER_ZIP, BUYER_COUNTY),
SELECT ZIP, COUNTY, SUM_MME.MME_SUM/(SELECT DISTINCT(POP) FROM CSE532.ZIPPOP WHERE CSE532.ZIPPOP.ZIP = SUM_MME.BUYER_ZIP AND CSE532.ZIPPOP.POP!=0) AS AVERAGE_POP_MME, RANK() OVER (ORDER BY SUM_MME.MME_SUM/(SELECT DISTINCT(POP) FROM CSE532.ZIPPOP WHERE CSE532.ZIPPOP.ZIP = SUM_MME.BUYER_ZIP AND CSE532.ZIPPOP.POP != 0) AS RANK FROM SUM_MME WHERE SUMME.MME_SUM / (SELECT DISTINCT(CSE532.ZIPPOP.POP) FROM CSE532.ZIPPOP WHERE CSE532.ZIPPOP.ZIP = SUM_MME.BUYER_ZIP AND CSE532.ZIPPOP.POP != 0) IS NOT NULL LIMIT 0, 10;



SELECT ZIP, COUNTY, SUMMME.mme_sum/(SELECT DISTINCT(POP) FROM CSE532.ZIPPOP WHERE CSE532.ZIPPOP.ZIP = SUMMME.zip_code






	cast(zip_county as varchar(25)) as county,
	SUMMME.mme_sum/(select distinct(pop) from cse532.zippop where cse532.zippop.zip = SUMMME.zip_code and cse532.zippop.pop!=0) as avg_mme_by_pop,
	rank() over (order by SUMMME.mme_sum/(select distinct(pop) from cse532.zippop where cse532.zippop.zip = SUMMME.zip_code and cse532.zippop.pop!=0) desc) as rank
	from 
		(select 
			 BUYER_ZIP as zip_code,
			 BUYER_COUNTY as zip_county,
			 cast(sum(MME) as int) as mme_sum
			 from cse532.dea_ny, cse532.zippop where cse532.dea_ny.BUYER_ZIP = cse532.zippop.zip
			 group by BUYER_ZIP, BUYER_COUNTY) as SUMMME
	where SUMMME.mme_sum / (select distinct(cse532.zippop.pop) from cse532.zippop where cse532.zippop.zip = SUMMME.zip_code and cse532.zippop.pop!=0) is not null
limit 0, 10;
