package stock.Payment;

public class CardDetails {
	
	private int ID;
	private String CardName;
	private String CardHolderName;
	private String CardNumber;
	private String ValidThru;
	private String CVV;
	

	public CardDetails(int id, String cardName, String cardHolderName, String cardNumber, String validThru, String cVV) {
		id = ID;
		CardName = cardName;
		CardHolderName = cardHolderName;
		CardNumber = cardNumber;
		ValidThru = validThru;
		CVV = cVV;
	}

	public int getID() {
		return ID;
	}

	public String getCardName() {
		return CardName;
	}



	public String getCardHolderName() {
		return CardHolderName;
	}

	public String getCardNumber() {
		return CardNumber;
	}

	public String getValidThru() {
		return ValidThru;
	}

	public String getCVV() {
		return CVV;
	}
	
	


}
