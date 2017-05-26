shuffle = (array)->
    array = array.slice()
    i = array.length
    if (i == 0)
        return array

    while (--i)
        j = Math.floor(Math.random() * (i + 1))
        temp = array[i]
        array[i] = array[j]
        array[j] = temp

    return array

#######################################################################

# main function

#######################################################################
main = ->
    content = $('#tweet-box-home-timeline > div')
    str = content.text()
    segm = new TinySegmenter()
    segs = segm.segment(str)
    cstr = shuffle(segs).join("/")
    console.log(cstr)
    content.text(cstr)

# run main function
main()
