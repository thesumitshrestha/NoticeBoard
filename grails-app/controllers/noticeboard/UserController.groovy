package noticeboard

class UserController {

    def index() {
        render view: '../index'
    }
    def logout(){
        session.user=null
        render view: '../notice/HomePage'
    }
    def authenticate(){
        def user=User.findByUsernameAndPassword(params.username,params.password)
        if(user){
            session.user=user.username
            redirect controller:'notice',action: 'homePage'
        }
        else{
            redirect action: 'index'
        }
    }
}
