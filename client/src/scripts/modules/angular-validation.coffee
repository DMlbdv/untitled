angular.module 'angular.validation', ['validation']
  .config ($validationProvider)->


    expression = 
      login: /[a-zA-Z0-9._-]{3,16}}/i #Username are 3-15 characters
      digitsDashes: /[^0-9 \-]+/ #accept only spaces, digits and dashes
      postal: /[a-zA-Z\d\s\-\,\#\.\+]+/ #postal adres
      zip: /^\d{5,6}(?:[-\s]\d{4})?$/ #zipCode
      dateISO: /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/# dateISO-method
      date: /((0[1-9])|(1[0-2]))[\/-]((0[1-9])|(1[0-9])|(2[0-9])|(3[0-1]))[\/-](\d{4})/#Date – accept date input in the mm/dd/yyyy or mm-dd-yyyy formats.
      charsetLim: /[\w]{1,140}/# Character Limit 140
      password: /(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9].*[0-9])(?=.*[^a-zA-Z0-9]).{8,}/# only accept a string that has 1 uppercase alphabet, 1 lowercase alphabet, 2 digits and 1 special character. Also the minimum allowed length is 8 characters.
      'password-conf':/(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9].*[0-9])(?=.*[^a-zA-Z0-9]).{8,}/
      phone: /\+?\(?\d{2,4}\)?[\d\s-]{3,}/# preceded by an optional “+” sign and the area code may be inside brackets.

      required: (value) ->
          !!value
      range: (value, scope, element, attrs) ->
              value  if value >= parseInt attrs.min  and value <= parseInt attrs.max

      url: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
      email: /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
      number: /^\d+$/

    defaultMsg =
      login: 
        error: 'Nope, please digits and letters only!'
        success: 'Looks fine'
      
      password: 
        error: '1 uppercase alphabet, 1 lowercase alphabet, 2 digits and 1 special character, min-length 8'
        success: 'Looks fine'
      
      'password-conf': 
        error: 'Please enter the same password again.'
        success: 'Looks fine'

      required:
        error: "Please, type something!!"
        success: "Looks great!"

      range:
        error: 'Number should between 5 ~ 10'
        success: 'Looks fine'

      url:
        error: "This should be Url"
        success: "It's Url"

      email:
        error: "Please enter a valid email address"
        success: "It's Email"

      number:
        error: "This should be Number"
        success: "It's Number"

    $validationProvider
      .setExpression expression
      .setDefaultMsg defaultMsg
