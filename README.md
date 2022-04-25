# EP
# ver 1.1
# 주차장 차단 시간 로직변경
![로직 설명](https://user-images.githubusercontent.com/93980966/165082528-0f9cbbda-6840-4efa-a04f-45df82eb185d.png)

# 소스코드
	public List<HashMap<String, Object>> getSectionInfo(HashMap<String, Object> params) throws ParseException {
    // 리턴할 배열을 담을 공간생성
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
    
    // 문자열 날짜 변환을 위한 formatter 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
    
    // 섹션(칸그룹)을 가져와서 섹션별로 예약시간에 대해 예약 및 차단 내역을 가져와서 end시간이 start시간보다 작으면 사용 카운트를 -1 해준다.
		for(HashMap<String, Object> temp :  parkingBlockDao.getSectionInfo(params)) {
			temp.put("daterange", params.get("daterange"));
			List<HashMap<String, Object>> useList = parkingBlockDao.getSectionUseList(temp);
			int useCount = useList.size();
			for(HashMap<String, Object> useMap : useList){
				Date useDate = formatter.parse(String.valueOf(useMap.get("END")));
				long end = useDate.getTime();
				
				for(HashMap<String, Object> compareMap : parkingBlockDao.getSectionUseList(temp)) {
					Date start = formatter.parse(String.valueOf(useMap.get("START")));
					if( end < start.getTime()) {
						useCount--;
					}
				}
			}
			temp.put("SEC_USE", useCount);
			resultList.add(temp);
		}
		return resultList;
	}


everyparking
Final project 기간 1.5개월

![img 0](https://user-images.githubusercontent.com/93980966/163712742-671b40c5-044e-416f-99dc-afb3bbcda855.png)
![img 1](https://user-images.githubusercontent.com/93980966/163712746-b773c773-535d-42ca-bb8a-734a9a4b45d1.png)
