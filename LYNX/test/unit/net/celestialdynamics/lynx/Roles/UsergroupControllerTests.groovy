package net.celestialdynamics.lynx.Roles



import org.junit.*
import grails.test.mixin.*

@TestFor(UsergroupController)
@Mock(Usergroup)
class UsergroupControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/usergroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.usergroupInstanceList.size() == 0
        assert model.usergroupInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.usergroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.usergroupInstance != null
        assert view == '/usergroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/usergroup/show/1'
        assert controller.flash.message != null
        assert Usergroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/usergroup/list'

        populateValidParams(params)
        def usergroup = new Usergroup(params)

        assert usergroup.save() != null

        params.id = usergroup.id

        def model = controller.show()

        assert model.usergroupInstance == usergroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/usergroup/list'

        populateValidParams(params)
        def usergroup = new Usergroup(params)

        assert usergroup.save() != null

        params.id = usergroup.id

        def model = controller.edit()

        assert model.usergroupInstance == usergroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/usergroup/list'

        response.reset()

        populateValidParams(params)
        def usergroup = new Usergroup(params)

        assert usergroup.save() != null

        // test invalid parameters in update
        params.id = usergroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/usergroup/edit"
        assert model.usergroupInstance != null

        usergroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/usergroup/show/$usergroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        usergroup.clearErrors()

        populateValidParams(params)
        params.id = usergroup.id
        params.version = -1
        controller.update()

        assert view == "/usergroup/edit"
        assert model.usergroupInstance != null
        assert model.usergroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/usergroup/list'

        response.reset()

        populateValidParams(params)
        def usergroup = new Usergroup(params)

        assert usergroup.save() != null
        assert Usergroup.count() == 1

        params.id = usergroup.id

        controller.delete()

        assert Usergroup.count() == 0
        assert Usergroup.get(usergroup.id) == null
        assert response.redirectedUrl == '/usergroup/list'
    }
}
