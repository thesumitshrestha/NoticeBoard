package noticeboard

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NoticeController {
    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Notice.list(params), model:[noticeInstanceCount: Notice.count()]
    }

    def show() {
        String showId= params.id
        showId=showId.replace("[","").replace("]","") as long
        [noticeInstance:Notice.findById(showId)]

    }

    def create() {
        if(session.user){
            respond new Notice(params)
        }else{
            flash.message="You are not allowed"
            redirect(action: 'homePage')
        }
    }

    @Transactional
    def save(Notice noticeInstance) {
        if (noticeInstance == null) {
            notFound()
            return
        }

        if (noticeInstance.hasErrors()) {
            respond noticeInstance.errors, view:'create'
            return
        }

        noticeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'notice.label', default: 'Notice'), noticeInstance.id])
                redirect action: 'homePage'
            }
            '*' { respond noticeInstance, [status: CREATED] }
        }
    }

    def edit(Notice noticeInstance) {
        if(session.user){
            respond noticeInstance
        }else{
            flash.message="You are not allowed"
            redirect(action: 'homePage')
        }
    }

    @Transactional
    def update(Notice noticeInstance) {
        if(session.user){
        if (noticeInstance == null) {
            notFound()
            return
        }

        if (noticeInstance.hasErrors()) {
            respond noticeInstance.errors, view:'edit'
            return
        }

        noticeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Notice.label', default: 'Notice'), noticeInstance.id])
                redirect(action: 'getCategoryData',params: [category: noticeInstance.category])

            }
            '*'{ respond noticeInstance, [status: OK] }
        }
        }else{
            flash.message="You are not allowed"
            redirect(action: 'homePage')
        }
    }

    @Transactional
    def delete() {
        if(session.user){
            def noticeInstance=new Notice()
            noticeInstance=Notice.findById(params.id as long)
            String category=noticeInstance.category
            noticeInstance.delete(flush: true)
            redirect(action: 'getCategoryData',params: [category: category])
        /*if (noticeInstance == null) {
            notFound()
            return
        }

        noticeInstance.delete flush:true
            noticeInstance.category
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Notice.label', default: 'Notice'), noticeInstance.id])
            }
            '*'{ render status: NO_CONTENT }
        }*/

        }else{
            flash.message="You are not allowed"
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'notice.label', default: 'Notice'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def homePage(){
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
        def todaysDate=ft.format(new Date())
        Date tDate = Date.parse( 'yyyy-MM-dd', todaysDate )
        def noticeList=Notice.findAllByNoticeDate(tDate)
        render model:[noticeInstanceList: noticeList],view:'HomePage'
    }
    def getCategoryData(){
        def category=params.category
        def noticeInstanceList=Notice.findAllByCategory(category)
        render view:'categoryData',model: [noticeInstanceList:noticeInstanceList,noticeInstanceCount: noticeInstanceList.size(),category: category]
    }
}
