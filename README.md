# EP
# ver 1.1
# 주차장 차단 시간 로직변경
![그림2](https://user-images.githubusercontent.com/93980966/165083169-80d6bd33-028b-433a-bca4-740f456e8ea6.jpg)

# 소스코드
# 설명: 정렬된 예약기간을 가져와서 kanList의 배열에 long 배열을 담아준다. 그리고 다음 회차때 예약기간의 시작시간이 기존 배열의 종료시간보다 크면 같은 칸을 쓰는 것으로 간주해 바꿔준다. 그렇지 않으면 시간이 중복됨으로 long 배열을 생성해서 kanList에 add작업을 수행한다. 그러면 결론 적으로 칸별로 예약시간을 나열할 수 있다
	public List<HashMap<String, Object>> getSectionInfo(HashMap<String, Object> params) throws ParseException {
		List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		for(HashMap<String, Object> temp :  parkingBlockDao.getSectionInfo(params)) {
			temp.put("daterange", params.get("daterange"));
			List<HashMap<String, Object>> useList = parkingBlockDao.getSectionUseList(temp);
			ArrayList<long[]> kanList = null;
			if(useList.size() > 0) {
				for(HashMap<String, Object> useMap : useList){
					Date startDate = formatter.parse(String.valueOf(useMap.get("START")));
					Date endDate = formatter.parse(String.valueOf(useMap.get("END")));
					long start = startDate.getTime();
					long end = endDate.getTime();
					if (kanList == null) {
						long[] tt = {start, end};
						kanList = new ArrayList<long[]>();
						kanList.add(tt);
					} else {
						boolean check = true;
						int kanSize = kanList.size();
						for(int i=0; i<kanList.size(); i++) {
							if(kanList.get(i)[1] < start) {
								long[] tt = {start, end};
								kanList.set(i, tt);
								check = false;
								break;
							}
						}
						if(check) {
							long[] tt = {start, end};
							kanList.add(tt);
						}
					}
				}
				temp.put("SEC_USE", kanList.size());
			}
			resultList.add(temp);
		}
		return resultList;
	}

everyparking
Final project 기간 1.5개월

![img 0](https://user-images.githubusercontent.com/93980966/163712742-671b40c5-044e-416f-99dc-afb3bbcda855.png)
![img 1](https://user-images.githubusercontent.com/93980966/163712746-b773c773-535d-42ca-bb8a-734a9a4b45d1.png)
