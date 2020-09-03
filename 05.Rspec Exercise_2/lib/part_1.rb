def partition(arr, n)
    md_arr, less_arr, greateq_arr = [], [], []

    arr.each do |el|
        if el < n
            less_arr << el
        else
            greateq_arr << el
        end
    end
    md_arr.push(less_arr, greateq_arr)
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each { |k, v| new_hash[k] = v}
    hash2.each { |k, v| new_hash[k] = v}
    new_hash
end