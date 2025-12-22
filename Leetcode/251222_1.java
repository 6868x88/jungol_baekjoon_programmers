class Solution {
    public int reverse(int x) {
   
   		char[] arr = String.valueOf(x).toCharArray();
		char[] reverse = new char[arr.length];
		
		for(int i=0; i<arr.length; i++) {
			reverse[i] = arr[arr.length - 1 - i];
		}
		String str = "";
		if(reverse[reverse.length-1] == '-') {
			str = '-' + new String(reverse, 0, reverse.length - 1);
		}else {
			str = new String(reverse);
		}
		long answer = Long.parseLong(str);
         if (answer > Integer.MAX_VALUE || answer < Integer.MIN_VALUE) {return 0;}
         return (int)answer;



    }

   public int reverse_a(int x) {
    boolean neg = x < 0;
    String s = new StringBuilder(String.valueOf(Math.abs(x)))
                    .reverse()
                    .toString();

    long val = Long.parseLong(s);
    if (neg) val = -val;

    if (val > Integer.MAX_VALUE || val < Integer.MIN_VALUE) return 0;
    return (int) val;
}
}

