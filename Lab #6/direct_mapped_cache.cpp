//20200614 02:38 PM Complete Input, main(), HextoBinary() by 0716236
//20200615 10:38 AM Complete binary_to_decimal(), CacheSimulator() by 0716236
//20200615 11:44 AM Modify HexToBinary()
#include <iostream>
#include <iomanip>
#include <fstream>
#include <cmath>
#include <vector>
#include <string>

using namespace std;
// convert the input hex string to binary
vector<vector<int> > HexToBinary(vector<string> &input){
    vector<vector<int> > result;
    result.resize(input.size());
    for (int i = 0; i < result.size();i++){
        // initialize 32-bit address
        result[i].resize(32, 0);
        // processing each byte and we need to handle any size of input address string
        int tmp = 0;
        for (int j = 0; j < input[i].size();j++){
            // convert hex to decimal
            if(input[i][j]>='0' && input[i][j]<='9'){
                tmp *= 16;
                tmp += input[i][j] - '0';
            }
            else if(input[i][j]>='A' && input[i][j]<='F'){
                tmp *= 16;
                tmp += input[i][j] - 'A' + 10;
            }
        }
        // convert decimal to binary
        int index = 31;
        while(tmp && index>=0){
            result[i][index] = tmp % 2;
            tmp /= 2;
            index--;
        }
    }
    return result;
}

int binary_to_decimal(vector<int> &target, int start, int end){
    int result = 0;
    for (int i = start; i <= end;i++){
        result *= 2;
        result += target[i];
    }
    return result;
}

// Cache Simulation
void CacheSimulator(vector<vector<int> > &binary_string, int CACHESIZE, int BLOCKSIZE){
    // calculate some needed numbers
    int block_num = (CACHESIZE * 1024) / BLOCKSIZE;
    int offset_length = int(log2(BLOCKSIZE));
    int index_length = int(log2(block_num));

    // initialize the cache
    vector<int> cache_block;
    cache_block.resize(block_num, -1);

    int hit = 0, miss=0;
    for (int i = 0; i < binary_string.size();i++){
        int index = binary_to_decimal(binary_string[i], 32-(offset_length+index_length),31-offset_length);
        int tag = binary_to_decimal(binary_string[i], 0, 32-(offset_length+index_length+1));
        if(cache_block[index]==tag){
            hit++;
        }
        else{
            miss++;
            cache_block[index] = tag;
        }
    }
    float hit_rate = (float(hit) / float(hit + miss))*100;
    float miss_rate = (float(miss) / float(hit + miss))*100;
    cout << "Cache_size: " << CACHESIZE << "K" << endl;
    cout << "Block_size: " << BLOCKSIZE << endl;
    cout << "Hit rate: " << fixed <<setprecision(2) << hit_rate << "% (" << hit << "),  Miss rate: " << miss_rate << "% (" << miss << ")" << endl;
}

int main(){
    fstream file;
    string line;
    vector<string> string_buffer;

    file.open("DCACHE.txt", ios::in);
    if(!file){
        cout << "Reading file failed!" << endl;
    }
    else{
        while(getline(file,line)){
            string_buffer.push_back(line);
        }
        file.close();
    }

    vector<vector<int> > binary_string= HexToBinary(string_buffer);
    int cache[4] = {4,16,64,256};
    int block[5] = {16,32,64,128,256};
    for (int i = 0; i < 4;i++){
        for (int j = 0; j < 5;j++){
            CacheSimulator(binary_string,cache[i],block[j]);
            cout << endl;
        }
    }

    return 0;
}
