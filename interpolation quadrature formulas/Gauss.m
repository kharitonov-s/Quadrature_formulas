function z=Gauss(A,b)
    %���������� ������� � ������������ ����
    function z=Simplex(A,b)
        n=size(A,1);% ����������� ����� ��������� �������
        C=cat(2,A,b);% �������� ����������� ������� �������
        for i=1:n-1
            %����� ������ �� ������ �������
            for j=0:n
                C(i,n+1-j)=C(i,n+1-j)/C(i,i);   %n=3 = C(1,4)=C(1,4)/C(1,1).C(1,2)=C(1,2)/C(1,1)..C(1,1)=C(1,1)/C(1/1)=1
            end;
            %�������� i ������, ���������� �� ������ ��������� ������� ����. ������, �� ���������
            for m=i+1:n
                alpha=C(m,i); %������ ��������� ������� ����.������
                for j=i:n+1
                    C(m,j)=C(m,j)-alpha*C(i,j); %C(2,1)=C(2,1)-C(2,1)*C(1,1)=0; C(2,2)=C(2,2)-C(2,1)*C(1,2)
                end;
            end;
        end;
        C(n,n+1)=C(n,n+1)/C(n,n);
        C(n,n)=1;
        z=C;
    end

C=Simplex(A,b);
N=size(A,1);
v(N)=C(N,N+1);
for j=1:N-1
    s=0;
    %����������� ��������� �
    for k=0:j-1
        s=s+C(N-j,N-k)*v(N-k);%s=0+C(2,3)*x3; s=C(2,3)*x3+C(2,2)*V(2)
    end;
    %������ �
    v(N-j)=(C(N-j,N+1)-s)/C(N-j,N-j); %V(2)=(C(2,4)-C(2,3)*x3)/C(2,2)
end;
z=v';
end

