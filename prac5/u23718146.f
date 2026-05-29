program statisticsProgram
    
    !disable implicit typing, more reliable
    implicit none

    !array of real numbers
    real :: arr(5)
    
    !store results
    real :: modeValue
    real :: meanValue
    real :: medianValue

    !read user input
    call readData(arr)

    !calculations
    modeValue = findMode(arr)
    meanValue = findMean(arr)
    medianValue = findMedian(arr)

    !results
    print *, "Mode: ", modeValue
    print *, "Mean: ", meanValue
    print *, "Median: ", medianValue

contains

    !read 5 floats
    subroutine readData(arr)

        implicit none

        real, intent(out) :: arr(5)
        integer :: i

        print *, "Enter 5 floats:"

        do i = 1, 5
            print *, "Enter value ", i, ":"
            read *, arr(i)
            print *, "Entered ", arr(i)
        end do

    end subroutine readData


    !sum and divide by 5
    real function findMean(arr)

        implicit none

        real, intent(in) :: arr(5)
        integer :: i
        real :: total

        total = 0.0

        !add
        do i = 1, 5
            total = total + arr(i)
        end do

        !divide
        findMean = total / 5.0

    end function findMean


    !compare and check for matching vals
    real function findMode(arr)

        implicit none

        real, intent(in) :: arr(5)

        integer :: i
        integer :: j
        integer :: count
        integer :: maxCount

        real :: mode

        maxCount = 0
        mode = arr(1)

        !compare each element with every other element
        !O(n^2) ahh
        do i = 1, 5
            count = 0

            do j = 1, 5

                !count matches
                if (arr(i) == arr(j)) then
                    count = count + 1
                end if

            end do

            !update if new mode
            if (count > maxCount) then
                maxCount = count
                mode = arr(i)
            end if

        end do

        findMode = mode

    end function findMode


    !sort and take middle index
    real function findMedian(arr)

        implicit none

        real, intent(in) :: arr(5)

        real :: tempArr(5)
        real :: temp

        integer :: i
        integer :: j

        !copy original array so it is not modified
        tempArr = arr

        !bubble sort copied
        do i = 1, 4

            do j = 1, 5 - i

                if (tempArr(j) > tempArr(j + 1)) then

                    !bubble
                    temp = tempArr(j)
                    tempArr(j) = tempArr(j + 1)
                    tempArr(j + 1) = temp

                end if

            end do

        end do

        !hardcoded since 5
        findMedian = tempArr(3)

    end function findMedian

end program statisticsProgram