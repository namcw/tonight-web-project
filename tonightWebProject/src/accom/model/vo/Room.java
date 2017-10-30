package accom.model.vo;

import java.io.Serializable;

	public class Room implements Serializable{
		
		private int roomId; 			//객실 아이디
		private int accId; 				//숙소 번호
		private String roomName;      	//객실명
		private String roomDetails; 	//주말상세정보
		private int WeekendAdultPrice;	//주말성인가격
		private int WeekendChildPrice;	//주말소인가격
		private int WeekdaysAdultPrice; //평일성인가격
		private int WeekdaysChildPrice; //평일소인가격
		
		public Room() { }

		public Room(int roomId, int accId, String roomName, String roomDetails, int weekendAdultPrice,
				int weekendChildPrice, int weekdaysAdultPrice, int weekdaysChildPrice) {
			super();
			this.roomId = roomId;
			this.accId = accId;
			this.roomName = roomName;
			this.roomDetails = roomDetails;
			WeekendAdultPrice = weekendAdultPrice;
			WeekendChildPrice = weekendChildPrice;
			WeekdaysAdultPrice = weekdaysAdultPrice;
			WeekdaysChildPrice = weekdaysChildPrice;
		}

		public int getRoomId() {
			return roomId;
		}

		public void setRoomId(int roomId) {
			this.roomId = roomId;
		}

		public int getAccId() {
			return accId;
		}

		public void setAccId(int accId) {
			this.accId = accId;
		}

		public String getRoomName() {
			return roomName;
		}

		public void setRoomName(String roomName) {
			this.roomName = roomName;
		}

		public String getRoomDetails() {
			return roomDetails;
		}

		public void setRoomDetails(String roomDetails) {
			this.roomDetails = roomDetails;
		}

		public int getWeekendAdultPrice() {
			return WeekendAdultPrice;
		}

		public void setWeekendAdultPrice(int weekendAdultPrice) {
			WeekendAdultPrice = weekendAdultPrice;
		}

		public int getWeekendChildPrice() {
			return WeekendChildPrice;
		}

		public void setWeekendChildPrice(int weekendChildPrice) {
			WeekendChildPrice = weekendChildPrice;
		}

		public int getWeekdaysAdultPrice() {
			return WeekdaysAdultPrice;
		}

		public void setWeekdaysAdultPrice(int weekdaysAdultPrice) {
			WeekdaysAdultPrice = weekdaysAdultPrice;
		}

		public int getWeekdaysChildPrice() {
			return WeekdaysChildPrice;
		}

		public void setWeekdaysChildPrice(int weekdaysChildPrice) {
			WeekdaysChildPrice = weekdaysChildPrice;
		}
		
		@Override
		public String toString() {
			return roomId + ", " + accId + ", " + roomName + ", " + roomDetails + ", " + WeekendAdultPrice + ", " +
					WeekendChildPrice + ", " + WeekdaysAdultPrice + ", " + WeekdaysChildPrice;
		}
	}

	
	

