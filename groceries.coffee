Items = new Meteor.Collection 'items'

if Meteor.is_client
	ENTER = 13
	Template.list.items = ->
		Items.find {}

	Template.item.events =
		'click .done': ->
			Items.remove { _id: this._id }

	Template.addItem.events =
		'keyup input.newItem': (evnt) ->
			console.log evnt
			if evnt.type == 'keyup' && evnt.which == ENTER
				inputBox = $('.newItem')
				console.log(inputBox.val)
				Items.insert({name: inputBox.val() })
				inputBox.focus
