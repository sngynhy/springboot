package com.seong.app.model.userboard;

public class PaginationVO {
	
    private int pageSize = 10; // �� �������� �Խñ� ��
    private int rangeSize = 5; /** �� ��(range)�� ������ �� **/
    private int curPage = 1;  /** ���� ������ **/
    private int curRange = 1; /** ���� ��(range) **/
    private int listCnt; /** �� �Խñ� �� **/
    private int pageCnt;  /** �� ������ �� **/
    private int rangeCnt; /** �� ��(range) �� **/
    private int startPage = 1; /** ���� ������ **/
    private int endPage = 1; /** �� ������ **/
    private int startIndex = 0; /** ���� index **/
    private int prevPage; /** ���� ������ **/
    private int nextPage; /** ���� ������ **/
    
    public PaginationVO(int listCnt, int curPage) {
        
        /**
         * ����¡ ó�� ����
         * 1. �� ��������
         * 2. �� ��(range)��
         * 3. range setting
         */
        
        // �� �Խù� ���� ���� �������� Controller�� ���� �޾ƿ´�.
        setCurPage(curPage); /** ���������� **/
        setListCnt(listCnt); /** �� �Խù� �� **/
        setPageCnt(listCnt); /** 1. �� ������ �� **/
        setRangeCnt(pageCnt); /** 2. �� ��(range)�� **/
        rangeSetting(curPage); /** 3. ��(range) setting **/
        
        setStartIndex(curPage); /** DB ���Ǹ� ���� startIndex ���� **/
    }
    
    public void rangeSetting(int curPage){
        
        setCurRange(curPage);        
        this.startPage = (curRange - 1) * rangeSize + 1;
        this.endPage = startPage + rangeSize - 1;
        
        if(endPage > pageCnt){
            this.endPage = pageCnt;
        }
        
        this.prevPage = curPage - 1;
        this.nextPage = curPage + 1;
    }
    
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getCurRange() {
		return curRange;
	}
	public void setCurRange(int curPage) {
		this.curRange = (int)((curPage - 1) / rangeSize) + 1;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int listCnt) {
		this.pageCnt = (int) Math.ceil(listCnt * 1.0 / pageSize);
	}
	public int getRangeCnt() {
		return rangeCnt;
	}
	public void setRangeCnt(int pageCnt) {
		this.rangeCnt = (int) Math.ceil(pageCnt * 1.0 / rangeSize);
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int curPage) {
		this.startIndex = (curPage-1) * pageSize;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
}
