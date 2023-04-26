// 登录方式切换
window.addEventListener('load', function () {

    var isAccount = true


    var user_template = `
    <div class="account_input">
      <div class="item">
        <i class="user-icon"></i>
     <input type="text" id="username" name="username" placeholder="enter Username" autofocus="autofocus" required>
      </div>
      <div class="item">
        <i class="pwd-icon"></i>
        <input type="password" id="password" name="password" placeholder="enter password" required>
      </div>
    </div>
  `
    var phone_template = `
    <div class="phone_input">
      <div class="item_phone">
        <i class="phone-icon"></i>
        <input type="email" id="phone" name="email" placeholder="enter email" autofocus="autofocus" required>
      </div>
      <div class="item_check">
        <input type="text" id="check" name="code" placeholder="enter verification code" required>
        <button class="getCode" type="button">get verification code</button>
      </div>
    </div>
  `

    var input_box = document.querySelector('.input_box')


    input_box.innerHTML = user_template

    var account_a = document.querySelector('.account_a')
    var phone_a = document.querySelector('.phone_a')
    var forget_pwd = document.querySelector('.forget_pwd')

    account_a.addEventListener('click', function () {

        input_box.innerHTML = user_template


        var input_user = document.querySelector('#username')

        isAccount = true
        account_a.style.color = '#03a9f4'
        phone_a.style.color = '#666'

        input_user.focus()
    })


    phone_a.addEventListener('click', function () {

        input_box.innerHTML = phone_template


        var phone_input = document.querySelector('.phone_input')

        var input_phone = document.querySelector('#phone')

        isAccount = false
        account_a.style.color = '#666'
        phone_a.style.color = '#03a9f4'
        phone_input.style.marginBottom = '8.1vh'
        input_phone.focus()

        // 创建XMLHttpRequest
        function CreateXmlHttp() {

            var xhr = null

            if (window.XMLHttpRequest) {

                xhr = new XMLHttpRequest()
            } else if (window.ActiveXObject) {

                xhr = new ActiveXObject('Microsoft.XMLHTTP')
            }

            return xhr
        }


        var getCodeBtn = document.querySelector(".getCode");


        getCodeBtn.addEventListener("click", function() {

            getCodeBtn.disabled = true;
            var second = 10;
            var timer = setInterval(function () {
                getCodeBtn.innerText = second + "s can be retrieved later"
                if (second <= 0) {
                    clearInterval(timer);
                    getCodeBtn.innerText = "get verification code"
                    getCodeBtn.disabled = false;
                }
                second--;
            }, 1000);


            var xhr = CreateXmlHttp()
            var email = input_phone.value


            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {

                    if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {

                        var res = xhr.responseText
                        var jsonObj = eval("("+res+")")
                        console.log("res:"+res)
                        if(jsonObj.type == 0) {
                            alert(jsonObj.error);
                        } else {
                            alert("The email has been sent successfully, please check the email and verify it as soon as possible")
                        }
                    } else {
                        alert("Email sending failed")
                    }
                }
            }

            xhr.open('POST','/FYP1_war_exploded/EmailServlet',true)

            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')

            xhr.setRequestHeader('If-Modified-Since', '0')

            xhr.send("email="+email);


        })

    })

})