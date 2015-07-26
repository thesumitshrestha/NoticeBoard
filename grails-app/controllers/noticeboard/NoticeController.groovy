package noticeboard



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NoticeController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Notice.list(params), model:[noticeInstanceCount: Notice.count()]
    }

    def show(Notice noticeInstance) {
        respond noticeInstance
    }

    def create() {
        respond new Notice(params)
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
        respond noticeInstance
    }

    @Transactional
    def update(Notice noticeInstance) {
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
                redirect action: 'homePage'
            }
            '*'{ respond noticeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Notice noticeInstance) {

        if (noticeInstance == null) {
            notFound()
            return
        }

        noticeInstance.delete flush:true
        noticeInstance.category
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Notice.label', default: 'Notice'), noticeInstance.id])
                redirect action:"getCategoryData",params: [category:noticeInstance.category]
            }
            '*'{ render status: NO_CONTENT }
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
        render view:'HomePage'
    }
    def getCategoryData(){
        def category=params.category
        println "Getting Category Data"+category
        def noticeInstanceList=Notice.findAllByCategory(category)
        render view:'categoryData',model: [noticeInstanceList:noticeInstanceList,noticeInstanceCount: noticeInstanceList.size(),category: category]
    }
}
