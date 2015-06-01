Constants = require '../constants/constants'
UsersQueries = require '../queries/users_queries'

module.exports = Marty.createStore
  id: 'UsersStore'

  handlers:
    setUsers: Constants.users.SET_USERS
    addUser: Constants.users.ADD_USER
    replaceUser: Constants.users.REPLACE_USER

  findAll: ->
    @fetch
      id: 'all-users'
      locally: ->
        @state.users
      remotely: ->
        UsersQueries.findAll()

  setUsers: (users) ->
    @setState
      users: users

  addUser: (user) ->
    @state.users.push user
    @hasChanged()

  replaceUser: (user) ->
    index =  _.indexOf @state.users, _.findWhere(@state.users, id: id)
    @state.users[index] = user
    @hasChanged()
