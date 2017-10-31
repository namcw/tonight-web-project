package accom.model.vo;


import java.io.Serializable;
import java.sql.Date;


	public class Room implements Serializable{
		
		private int roomId; 			//객실 아이디
		private int accId; 			//숙소 번호
		private String roomState; 		//객실 예약 가능 상태
		private int adult_Price; 		//성인 가격
		private int child_Price; 		//소인 가격
		private double discount; 	//할인율
		private String roomImage; 		//객실 이미지 경로
		private String roomDetails; 		//상세정보
		private String roomName;      //객실명
		public Room() {}

		public Room(String roomName,  int adult_Price, int child_Price, double discount, 
				String roomState, String roomDetails) {
			super();
		
			this.roomState = roomState;
			this.adult_Price = adult_Price;
			this.child_Price = child_Price;
			this.discount = discount;
			this.roomDetails = roomDetails;
			this.roomName = roomName;
		}

		public int getRoomId() {
			return roomId;
		}

		public String getRoomName(){
			return roomName;
		}
		
		public int getAccId() {
			return accId;
		}

		public String getRoomState() {
			return roomState;
		}

		public int getAdult_Price() {
			return adult_Price;
		}

		public int getChild_Price() {
			return child_Price;
		}

		public double getDiscount() {
			return discount;
		}

		public String getRoomImage() {
			return roomImage;
		}

		public String getRoomDetails() {
			return roomDetails;
		}

		public void setRoomId(int roomId) {
			this.roomId = roomId;
		}
		
		public void setRoomName(String roomName){
			this.roomName = roomName;
		}
		
		public void setAccId(int accId) {
			this.accId = accId;
		}

		public void setRoomState(String roomState) {
			this.roomState = roomState;
		}

		public void setAdult_Price(int adult_Price) {
			this.adult_Price = adult_Price;
		}

		public void setChild_Price(int child_Price) {
			this.child_Price = child_Price;
		}

		public void setDiscount(double discount) {
			this.discount = discount;
		}

		public void setRoomImage(String roomImage) {
			this.roomImage = roomImage;
		}
		
		

		public void setRoomDetails(String roomDetails) {
			this.roomDetails = roomDetails;
		}

		
		@Override
		public String toString(){
			return this.roomId + ", " + this.accId + ", " + this.roomState + ", " + this.adult_Price + ", " 
				 + this.child_Price + ", " + this.discount + this.roomImage+ ", " + this.roomDetails;
		}
	}

	
	

