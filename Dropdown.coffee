# Add the following line to your project in Framer Studio.
# myModule = require "Dropown"
# Reference the contents by name, like myModule.myFunction() or myModule.myVar

class exports.Dropdown extends Layer
	constructor: (options) ->
		super(options)

		###
		Makes this layer the same size as a parent passed through
		###
		@parent = options.parent
		@width = options.parent.width
		@height = options.parent.height

		css = """
			.dropdown-framer {
				color: #{options.color};
				font-family: #{options.fontFamily}, serif;
				font-size: #{options.fontSize}px;
				font-weight: #{options.fontWeight};
				line-height: #{options.parent.height}px;
				width: #{options.parent.width}px;
				margin: 0;
				padding: 0 15px;
				-webkit-appearance: none;
				background-color: transparent;
				outline: none;
			}
		"""

		Utils.insertCSS(css)

		@backgroundColor = "transparent"

		formattedOptions = ""
		options.selectOptions.map((option) ->
			dropdownOptions = "<option>#{option}</option>"
			formattedOptions += dropdownOptions
		)

		formattedHtml = """
			<select class="dropdown-framer">
				#{formattedOptions}
			</select>
		"""

		@html = formattedHtml

	#Returns the value currently selected#
	getSelected: () ->
		return @._element.getElementsByClassName("dropdown-framer")[0].value
