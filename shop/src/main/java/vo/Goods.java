package vo;

public class Goods {
	// private GoodsImg goodsImg; 조인
	
	private int GoodsNo;
	private String GoodsName;
	private int GoodsPrice;
	private String updateDate;
	private String createDate;
	private String soldOut;
	public int getGoodsNo() {
		return GoodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		GoodsNo = goodsNo;
	}
	public String getGoodsName() {
		return GoodsName;
	}
	public void setGoodsName(String goodsName) {
		GoodsName = goodsName;
	}
	public int getGoodsPrice() {
		return GoodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		GoodsPrice = goodsPrice;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getSoldOut() {
		return soldOut;
	}
	public void setSoldOut(String soldOut) {
		this.soldOut = soldOut;
	}
	
	
	
}
