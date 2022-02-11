abstract class UserEvent {

}

class SetUserListFromRemotDB extends UserEvent{}
class SetUserListFromLocadDB extends UserEvent{}
class CreateUser extends UserEvent{}
class DeleteUser extends UserEvent{}