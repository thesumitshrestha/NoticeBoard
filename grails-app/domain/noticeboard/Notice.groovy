package noticeboard

class Notice {
    String title
    String description
    Date noticeDate=tillDate()
    String category
    def tillDate(){
        return new Date()
    }
    static constraints = {
        category(inList: ['clubActivities','administration','batch','other'])
    }
}
