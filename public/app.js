

function button()
	{
		var x = window.localStorage.getItem('bb');
		x = x * 1 + 1
		window.localStorage.setItem('bb', x);

		alert(x);
	}

function add_to_cart(id)
{
	alert('You added pizza with id=' + id);
}