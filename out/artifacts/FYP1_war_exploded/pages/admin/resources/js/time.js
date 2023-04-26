// 获取时间
window.addEventListener('load', function () {

    var date = document.querySelector('.date')
    var sec = document.querySelector('.second')
    setInterval(function () {

        var d = new Date()
        var year = d.getFullYear()
        var month = d.getMonth() + 1
        var day = d.getDate()
        var hour = d.getHours()
        var minute = d.getMinutes()
        var second = d.getSeconds()

        if (month < 10) month = '0' + month
        if (day < 10) day = '0' + day
        if (hour < 10) day = '0' + hour
        if (minute < 10) minute = '0' + minute
        if (second < 10) second = '0' + second


        var date_str = year + ' : ' + month + ' : ' + day + ' : '
        var sec_str = hour + ' : ' + minute + ' : ' + second

        date.innerHTML = date_str
        sec.innerHTML = sec_str
    }, 1000)
})